# 1. Base Image
# Usamos uma imagem Python estável e enxuta (slim).
FROM python:3.13.5-alpine3.21

# 2. Working Directory
# Define o diretório de trabalho dentro do contêiner.
WORKDIR /app

# 3. Instalação de Dependências
# Copia o arquivo de dependências primeiro para aproveitar o cache do Docker.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 4. Copiar Código da Aplicação
COPY . .

# 5. Expor a Porta
EXPOSE 8000

# 6. Comando de Execução
# Inicia o servidor Uvicorn. O host 0.0.0.0 permite acesso externo ao contêiner.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]