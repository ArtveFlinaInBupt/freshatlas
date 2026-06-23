lang ?= en

ifeq ($(lang), en)
	pdf_name := BUPT-freshatlas-
	png_names := BUPT-overview- BUPT-dormitory- BUPT-campus- BUPT-placement- BUPT-commute-
else ifeq ($(lang), zh)
	pdf_name := 柏油图谱
	png_names := 柏油总览 柏油宿舍 柏油校区 柏油入学考试 柏油通勤
else
	$(error "Unsupported language: $(lang). Supported languages are 'en' and 'zh'.")
endif

date := $(shell date +%y%m%d)
out_dir := out

main_src := main.typ
src_dir := content
png_srcs := overview.typ dormitory.typ campus.typ placement-test.typ commute.typ

target_pdf := $(out_dir)/$(pdf_name)$(date).pdf
target_pngs := $(foreach n,$(png_names),$(out_dir)/$(n)$(date).png)

COMPILE := typst compile --root . --input release=

all: pdf png

$(out_dir):
	mkdir -p $(out_dir)

pdf: $(out_dir)
	$(COMPILE) $(main_src) $(target_pdf)

png: $(target_pngs)

indices := $(shell seq 1 $(words $(png_srcs)))

define png_rule
$(out_dir)/$(1)$(date).png: $(src_dir)/$(2) | $(out_dir)
	$$(COMPILE) $(src_dir)/$(2) $$@ --ppi 300
endef

$(foreach i,$(indices),$(eval $(call png_rule,$(word $(i),$(png_names)),$(word $(i),$(png_srcs)))))

clean:
	rm -rf $(out_dir)

.PHONY: all pdf png clean
.DEFAULT_GOAL := all
