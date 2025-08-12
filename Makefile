DOCKERHUB_USER= abeerseada
IMAGE_NAME= advanced_go_app
TAG= latest

all: docker_build

docker_build: 
		@echo "Building the image..."
		docker build -t $(DOCKERHUB_USER)/$(IMAGE_NAME):$(TAG) .
		
docker_push: docker_build
		@echo "Pushing the image..."
		docker push $(DOCKERHUB_USER)/$(IMAGE_NAME):$(TAG)

clean: 
	@echo "Cleaning up..."
	docker rmi $(DOCKERHUB_USER)/$(IMAGE_NAME):$(TAG)
	   

.PHONY: docker_build docker_push clean
