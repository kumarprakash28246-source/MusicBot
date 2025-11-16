FROM ubuntu:22.04

# Install basic dependencies
RUN apt-get update && apt-get install -y curl python3 python3-pip ffmpeg

# Install NodeJS 18 (recommended for PyTgCalls)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs

# Copy project
COPY . /app/
WORKDIR /app/

# Install Python requirements
RUN pip3 install --no-cache-dir -U -r requirements.txt

CMD bash start
