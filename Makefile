TERRAFORM_VERSION?=0.12.16
GIT_CRYPT_VERSION?=0.6.0-1
REPO?=codequest/terraform-git-crypt
TAG=t$(TERRAFORM_VERSION)-gc$(GIT_CRYPT_VERSION)

all: build push

build:
	docker build \
		--build-arg TERRAFORM_VERSION=$(TERRAFORM_VERSION) \
		--build-arg GIT_CRYPT_VERSION=$(GIT_CRYPT_VERSION) \
		-t $(REPO):$(TAG) \
		.

push:
	docker push $(REPO):$(TAG)
