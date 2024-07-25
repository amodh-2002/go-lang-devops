# First is to pull a base image in this case it is golang and we can alias to it as base so that we can call this stage in next stage!!
FROM golang:1.22.5 as base

# Next is setting up the directory in my docker engine!!
WORKDIR /app

# Next is copying the dependency folder to the working directory this is similar to package.json file that we push first for a node application
COPY go.mod .

# Next is download the dependency usinfg the following command this is similar to npm install for node application!!
RUN go mod download

# Next is copying the rest of the files and folders to the working directory!!
COPY . .

# Next is to build the application to get the binary file which can be used to run the application this is similar to npm run build for node application!!
RUN go build -o main .


# Stage-2 use of distroless image
# The below line acts as a distroless image for go-application 
FROM gcr.io/distroless/base

# Next is to copy the build file from stage one to this stage so that we can run the application!!
COPY --from=base /app/main .

# Next is to copy the static file as well ig this is specific to go-lang!!
COPY --from=base /app/static ./static

# Next is to expose the application to sepcific port in this case it is 8080
EXPOSE 8080

# Next is to use the command that is gonna run the application similar to npm index.js for node application!!
CMD [ "./main" ]
