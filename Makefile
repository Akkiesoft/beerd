TARGET = beerd

TOOLPATH = ../z_tools/

MAKE     = $(TOOLPATH)make.exe -r
CPP      = $(TOOLPATH)cpp0.exe -P -I.
ASKA     = $(TOOLPATH)aska.exe
NASKCNV  = $(TOOLPATH)naskcnv0.exe -l -s
NASK     = $(TOOLPATH)nask.exe
IMGTOL   = $(TOOLPATH)imgtol.com
COPY     = copy
DEL      = del

# デフォルト動作

default :
	$(MAKE) img


ipl.bin : ipl.ask Makefile
	$(CPP) -o ipl.ias ipl.ask
	$(ASKA) ipl.ias ipl.3as
	$(NASKCNV) ipl.3as ipl.nas
	$(NASK) ipl.nas ipl.bin ipl.lst

$(TARGET).com : $(TARGET).nas Makefile
	$(NASK) $(TARGET).nas $(TARGET).com $(TARGET).lst

$(TARGET).img : ipl.bin $(TARGET).com Makefile
	$(COPY) /B ipl.bin+$(TARGET).com $(TARGET)_.img
	$(IMGTOL) e $(TARGET)_.img $(TARGET).img 1440
	$(DEL) $(TARGET)_.img


# コマンド
img :
	$(MAKE) $(TARGET).img

run :
	$(MAKE) $(TARGET).img
	$(COPY) $(TARGET).img ..\z_tools\qemu\fdimage0.bin
	$(MAKE) -C ../z_tools/qemu

clean :
	$(DEL) ipl.ias ipl.3as ipl.nas
	$(DEL) *.lst
	$(DEL) *.img
