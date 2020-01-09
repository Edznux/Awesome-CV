.PHONY: build

CC = xelatex
BUILD_DIR = build
RESUME_DIR_FR = build/resume_fr
RESUME_DIR_EN = build/resume_en
CV_DIR = cv/cv
RESUME_SRCS_FR = $(shell find $(RESUME_DIR_FR) -name '*.tex')
RESUME_SRCS_EN = $(shell find $(RESUME_DIR_EN) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

build: $(foreach x, coverletter resume_en resume_fr, $x.pdf)

resume_en.pdf: $(BUILD_DIR)/resume_en.tex $(RESUME_SRCS_EN)
	$(CC) -output-directory=$(BUILD_DIR) $<
resume_fr.pdf: $(BUILD_DIR)/resume_fr.tex $(RESUME_SRCS_FR)
	$(CC) -output-directory=$(BUILD_DIR) $<

coverletter.pdf: $(BUILD_DIR)/coverletter.tex
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	rm -rf $(BUILD_DIR)/*.pdf
