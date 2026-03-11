# Optimized Go Calculator: Multi-Stage Docker Build
This repository demonstrates the transition from a Standard (Fat) Docker Image to a High-Performance (Lean) Production Image. By utilizing Multi-Stage builds and the scratch base image, we reduce the footprint by over 98% and significantly harden the security posture.

##?? The Challenge
Standard Docker builds often package the entire Operating System and Build Toolchain (Compilers, Package Managers, Source Code) into the final production image.

Size: more than 500 MB (Ubuntu + Go Toolchain)

Vulnerabilities: High (Includes curl, apt, bash which can be exploited)

Efficiency: Slow CI/CD upload/download times.

## ??? The Solution: Multi-Stage Build
We use a Two-Stage approach to separate the Build Environment from the Runtime Environment.

1. Build Stage (build)
Uses ubuntu as a temporary workshop.

Installs the golang-go compiler.

Compiles the source code into a Statically Linked Binary using CGO_ENABLED=0.

2. Runtime Stage (scratch)
Uses scratch, an empty 0MB virtual filesystem.

Magic Step: Only the compiled binary is copied from the build stage.

Result: No OS, no shell, no vulnerabilities—just the application.



## Multi Stage Docker Build

The main purpose of choosing a golang based applciation to demostrate this example is golang is a statically-typed programming language that does not require a runtime in the traditional sense. Unlike dynamically-typed languages like Python, Ruby, and JavaScript, which rely on a runtime environment to execute their code, Go compiles directly to machine code, which can then be executed directly by the operating system.

So the real advantage of multi stage docker build and distro less images can be understand with a drastic decrease in the Image size.
