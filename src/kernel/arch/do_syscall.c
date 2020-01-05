#include <proc/sched.h>
#include <proc/proc.h>
#include <device/device.h>
#include <interrupt.h>
#include <device/kbd.h>
#include <filesys/file.h>

pid_t do_fork(proc_func func, void* aux1, void* aux2)
{
	pid_t pid;
	struct proc_option opt;

	opt.priority = cur_process-> priority;
	pid = proc_create(func, &opt, aux1, aux2);

	return pid;
}

void do_exit(int status)
{
	cur_process->exit_status = status; 	//종료 상태 저장
	proc_free();						//프로세스 자원 해제
	do_sched_on_return();				//인터럽트 종료시 스케줄링
}

pid_t do_wait(int *status)
{
	while(cur_process->child_pid != -1)
		schedule();
	//SSUMUST : schedule 제거.

	int pid = cur_process->child_pid;
	cur_process->child_pid = -1;

	extern struct process procs[];
	procs[pid].state = PROC_UNUSED;

	if(!status)
		*status = procs[pid].exit_status;

	return pid;
}

void do_shutdown(void)
{
	dev_shutdown();
	return;
}

int do_ssuread(void)
{
	return kbd_read_char();
}

int do_open(const char *pathname, int flags)
{
	struct inode *inode;
	struct ssufile **file_cursor = cur_process->file;
	int fd;

	for(fd = 0; fd < NR_FILEDES; fd++)
		if(file_cursor[fd] == NULL) break;

	if (fd == NR_FILEDES)
		return -1;

	if ( (inode = inode_open(pathname, flags)) == NULL)   // inode_open은 inode.c에 정의되어 있다
		return -1;
	
	if (inode->sn_type == SSU_TYPE_DIR)
		return -1;

	fd = file_open(inode,flags,0);
	
	return fd;
}

int do_read(int fd, char *buf, int len)
{
	return generic_read(fd, (void *)buf, len);
}
int do_write(int fd, const char *buf, int len)
{
	return generic_write(fd, (void *)buf, len);
}

int do_fcntl(int fd, int cmd, long arg)
{
	int flag = -1;
	struct ssufile **file_cursor = cur_process->file;


	if (cmd & F_DUPFD){         // 인자로 지정된 fd를 arg로 복사; 리턴: 새로 복제된 fd
        int newfd;
        if (arg >= NR_FILEDES)      // arg인자가 fd 범위보다 큰 경우 -1를 리턴
            return -1;

        for (newfd = arg; newfd < NR_FILEDES; newfd++)  // 이미 사용중인 fd인 경우 가장 작은 다음 값 할당
            if (file_cursor[newfd] == NULL)
                break;

        if (newfd >= NR_FILEDES)       // newfd가 지정된 fd 범위보다 큰 경우 -1 리턴
            return -1;

        file_cursor[newfd] = file_cursor[fd];   //새로 정한 fd의 ssufile구조체에 그 전 fd ssufile 구조체 대입

        return newfd;                  // 새로 할당된 fd 값을 리턴
	}
	else if (cmd & F_GETFL){
        struct ssufile *cursor;
		if ( (cursor = file_cursor[fd]) == NULL)    // fd의 ssufile 구조체가 어떠한 파일도 가르키고 있지 않을 때
            return -1;

        return flag = cursor->flags;                // fd인자가 가르키고 있는 파일의 flags를 리턴
	}
	else if(cmd & F_SETFL){
		struct ssufile *cursor;
		if ( (cursor = file_cursor[fd]) == NULL)    // fd의 ssufile 구조체가 어떠한 파일도 가르키고 있지 않을 때
            return -1;

        if (~arg & O_APPEND)                        // O_APPEND가 아닌 플래그를 arg에서 지정하면 -1 리턴
            return -1;
                                                    // O_APPEND 구현
        cursor->pos = cursor->inode->sn_size;       // pow를 파일 사이즈로

        cursor->flags |= O_APPEND;                  // 현재 파일 플래그에 O_APPEND 추가
        return cursor->flags;                       // 바뀐 파일 플래그 리턴
	}
	else{
	    return -1;                                  // 다른 fcntl의 cmd가 들어올 시 -1 리턴
	}
}
