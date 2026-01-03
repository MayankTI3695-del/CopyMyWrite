#pragma once
#include <Windows.h>
#include <securitybaseapi.h>
#define IOCTL_SCSI_PASS_THROUGH_DIRECT \
      CTL_CODE(FILE_DEVICE_CONTROLLER, 0x0405, METHOD_BUFFERED, FILE_READ_ACCESS | FILE_WRITE_ACCESS)
#define SCSI_SECTOR_SIZE (0x200)
#define SCSIOP_READ                     0x28
#define SCSIOP_WRITE                    0x2A
#define PAGE_SIZE                       0x1000
typedef struct _SCSI_PASS_THROUGH_DIRECT {
    USHORT  Length;
    UCHAR  ScsiStatus;
    UCHAR  PathId;
    UCHAR  TargetId;
    UCHAR  Lun;
    UCHAR  CdbLength;
    UCHAR  SenseInfoLength;
    UCHAR  DataIn;
    ULONG  DataTransferLength;
    ULONG  TimeOutValue;
    PVOID  DataBuffer;
    ULONG  SenseInfoOffset;
    UCHAR  Cdb[16];
} SCSI_PASS_THROUGH_DIRECT, * PSCSI_PASS_THROUGH_DIRECT;