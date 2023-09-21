FROM rust:1.72.0-buster AS chef
RUN cargo install cargo-chef --locked | tee /cargo-chef-install.log

FROM chef AS planner
COPY . .
RUN cargo chef prepare --recipe-path recipe.json | tee /cargo-chef-prepare.log

FROM chef AS builder
COPY --from=planner recipe.json recipe.json
RUN cargo chef cook --release --recipe-path recipe.json | tee /cargo-check-cook.log
COPY . .
RUN cargo build -vv --release | tee /cargo-build-release.log

FROM rust:1.72.0-buster AS runtime
RUN mkdir -p /target/release
COPY --from=builder /target/release/ /target/release/

ENTRYPOINT ["/bin/sh", "-c", "/target/release/member1 && /target/release/member2"]
