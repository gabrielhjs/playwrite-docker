# Start with a base Docker image that includes Playwright and a specific browser version.
FROM mcr.microsoft.com/playwright:v1.39.0-jammy

# Set the working directory inside the container.
WORKDIR /app

# Copy package.json and package-lock.json to the container.
COPY package*.json ./

# Install project dependencies using 'npm ci' to ensure a consistent environment.
RUN npm ci

# Install Playwright browser binaries with all dependencies.
RUN npx playwright install --with-deps

# Copy the rest of your application code into the container.
COPY src ./src

# Define the default command to run when the container starts.
CMD ["npm", "test"]
