FROM python:3.7.3-stretch

## Step 1:
# Create a working directory
WORKDIR /workdir

## Step 2:
# Copy source code to working directory
COPY app.py requirements.txt /workdir/
COPY model_data /workdir/model_data

## Step 3:
# Install packages from requirements.txt
# hadolint ignore=DL3013
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt
## Step 4:
# Expose port 80
EXPOSE 80/tcp
## Step 5:
# Run app.py at container launch
CMD ["python", "app.py"]
