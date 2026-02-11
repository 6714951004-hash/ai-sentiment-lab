FROM python:3.9-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8501
CMD [&quot;streamlit&quot;, &quot;run&quot;, &quot;app.py&quot;, &quot;--server.address=0.0.0.0&quot;]
FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8501

CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
FROM python:3.9-slim

WORKDIR /app

# ติดตั้ง dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ก๊อปปี้ไฟล์ทั้งหมดเข้าเครื่อง Server
COPY . .

# เปิด Port สำหรับ Streamlit
EXPOSE 8501

# คำสั่งรันโปรแกรม
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]