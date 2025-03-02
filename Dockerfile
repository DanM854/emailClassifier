# Usa la versión de Python 3.12 (misma que en tu entorno)
FROM python:3.12

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# solo los archivos necesarios antes de instalar dependencias
COPY requirements.txt .

# Instala las dependencias antes de copiar el resto del código
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Expone el puerto donde correrá FastAPI
EXPOSE 8000

# Comando para ejecutar la aplicación
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
