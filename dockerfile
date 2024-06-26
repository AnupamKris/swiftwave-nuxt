# Use the official Bun image
# See all versions at https://hub.docker.com/r/oven/bun/tags
FROM oven/bun:latest as base
WORKDIR /usr/src/app

# Install dependencies and build the project
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile
COPY . .
RUN bun run build

# Final stage: create a minimal production image
FROM oven/bun:latest
WORKDIR /usr/src/app

# Copy the built project and production dependencies
COPY --from=base /usr/src/app/.output /.output

# Run the app
EXPOSE 8100
ENV PORT=8100
CMD [ "bun", "run", "/.output/server/index.mjs" ]