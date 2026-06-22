lang ?= en

ifeq ($(lang), en)
	name := BUPT-freshatlas-
	name1 := BUPT-dormitory-
	name2 := BUPT-campus-
	name3 := BUPT-placement-
else ifeq ($(lang), zh)
	name := 柏油图谱
	name1 := 柏油宿舍
	name2 := 柏油校区
	name3 := 柏油入学考试
else
	$(error "Unsupported language: $(lang). Supported languages are 'en' and 'zh'.")
endif

date := $(shell date +%y%m%d)

src := main.typ
src1 := content/dormitory.typ
src2 := content/campus.typ
src3 := content/placement-test.typ
out_dir := out

target_pdf := $(out_dir)/$(name)$(date).pdf
target_png_1 := $(out_dir)/$(name1)$(date).png
target_png_2 := $(out_dir)/$(name2)$(date).png
target_png_3 := $(out_dir)/$(name3)$(date).png

COMPILE := typst compile --root . --input release=

all: pdf png

$(out_dir):
	mkdir -p $(out_dir)

pdf: $(out_dir)
	$(COMPILE) $(src) $(target_pdf)

png: $(out_dir)
	$(COMPILE) $(src1) $(target_png_1) --ppi 300
	$(COMPILE) $(src2) $(target_png_2) --ppi 300
	$(COMPILE) $(src3) $(target_png_3) --ppi 300

clean:
	rm -rf $(out_dir)

.PHONY: all pdf png clean
