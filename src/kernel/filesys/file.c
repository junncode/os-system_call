#include <filesys/inode.h>
#include <proc/proc.h>
#include <device/console.h>
#include <mem/palloc.h>


int file_open(struct inode *inode, int flags, int mode)
{
	int fd;
	struct ssufile **file_cursor = cur_process->file;

	for(fd = 0; fd < NR_FILEDES; fd++)   // file_cursor[fd] == NULL인 부분이 사용되지 않은 fd
	{
		if(file_cursor[fd] == NULL)
		{
			if( (file_cursor[fd] = (struct ssufile *)palloc_get_page()) == NULL)
				return -1;
			break;
		}	
	}
	
	inode->sn_refcount++;

	file_cursor[fd]->inode = inode;
	file_cursor[fd]->pos = 0;

	if(flags & O_APPEND){       // flags와 비트연산, O_APPEND (4)
		file_cursor[fd]->pos = inode->sn_size;  // uint16_t pos에 uint32_t sn_size 대입, 파일 맨 뒤 부터 시작
	}
	else if(flags & O_TRUNC){   // flags와 비트연산, O_TRUNC (8)
        file_cursor[fd]->inode->sn_size = 0;    // 파일 사이즈를 0으로 만들어 오프셋을 파일 시작 부터
		file_cursor[fd]->pos = 0;
	}

	file_cursor[fd]->flags = flags;
	file_cursor[fd]->unused = 0;

	return fd;
}

int file_write(struct inode *inode, size_t offset, void *buf, size_t len)
{
	return inode_write(inode, offset, buf, len);
}

int file_read(struct inode *inode, size_t offset, void *buf, size_t len)
{
	return inode_read(inode, offset, buf, len);
}
