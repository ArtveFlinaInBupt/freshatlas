lang ?= en

ifeq ($(lang), en)
	pdf_name := BUPT-freshatlas-
else ifeq ($(lang), zh)
	pdf_name := 柏油图谱
else
	$(error "Unsupported language: $(lang). Supported languages are 'en' and 'zh'.")
endif

srcs := overview|总览 dormitory|宿舍 campus|校区 placement|入学考试 commute|通勤

date := $(shell date +%y%m%d)
out_dir := out
main_src := main.typ

target_pdf := $(out_dir)/$(pdf_name)$(date).pdf

COMPILE := typst compile --root . --input release=

all: pdf png

$(out_dir):
	mkdir -p $(out_dir)

pdf: $(out_dir)
	$(COMPILE) $(main_src) $(target_pdf)

stem = $(firstword $(subst |, ,$1))

ifeq ($(lang), en)
	png_name = BUPT-$(call stem,$1)-
else
	png_name = 柏油$(lastword $(subst |, ,$1))
endif

target_pngs := $(foreach s,$(srcs),$(out_dir)/$(call png_name,$s)$(date).png)

png: $(target_pngs)

define png_rule
$(out_dir)/$(call png_name,$(1))$(date).png: content/$(call stem,$(1)).typ | $(out_dir)
	$$(COMPILE) content/$(call stem,$(1)).typ $$@ --ppi 300 --input single=true
endef

$(foreach s,$(srcs),$(eval $(call png_rule,$(s))))

clean:
	rm -rf $(out_dir)

.PHONY: all pdf png clean
.DEFAULT_GOAL := all
