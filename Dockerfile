# Use Node.js LTS
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY package*.json ./
RUN npm install -g serve && npm install

# Copy all project files
COPY . .

# Build the React app
RUN npm run build

# Expose the port
EXPOSE 3000

# Run the built app using 'serve'
CMD ["serve", "-s", "build", "-l", "3000"]
