# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.12-slim

ENV APP_DIR / application

WORKDIR $APP_DIR

# Install pip requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD [ "python", "main.py" ]
