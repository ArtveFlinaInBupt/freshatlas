lang ?= zh

# 仅校验语言合法性，不再参与 pdf 命名
ifneq ($(filter $(lang),en zh),$(lang))
$(error "Unsupported language: $(lang). Supported languages are 'en' and 'zh'.")
endif

prefix := freshatlas-
srcs := overview|总览 dormitory|宿舍 campus|校区 placement|入学考试 commute|通勤

date := $(shell date +%y%m%d)
src_dir := content
out_dir := out
main_src := main.typ

target_pdf := $(out_dir)/$(prefix)$(date).pdf

COMPILE := typst compile --root . --no-pdf-tags --input release=

all: pdf png

$(out_dir):
	mkdir -p $(out_dir)

pdf: $(out_dir)
	$(COMPILE) $(main_src) $(target_pdf)

stem = $(firstword $(subst |, ,$1))

ifeq ($(lang), en)
	png_name = $(prefix)$(call stem,$1)-
else
	png_name = $(prefix)$(lastword $(subst |, ,$1))-
endif

target_pngs := $(foreach s,$(srcs),$(out_dir)/$(call png_name,$s)$(date).png)

png: $(target_pngs)

define png_rule
$(out_dir)/$(call png_name,$(1))$(date).png: $(src_dir)/$(call stem,$(1)).typ | $(out_dir)
	$$(COMPILE) $(src_dir)/$(call stem,$(1)).typ $$@ --ppi 300 --input single=true
endef

$(foreach s,$(srcs),$(eval $(call png_rule,$(s))))

clean:
	find $(src_dir) -name '*.png' -type f -delete
	find $(src_dir) -name '*.pdf' -type f -delete
	rm -rf $(out_dir)

.PHONY: all pdf png clean
.DEFAULT_GOAL := all
