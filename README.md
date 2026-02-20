# 🛡️ Auditoría Digital y Automatización de Control Interno - KPMG Case

Este proyecto implementa un sistema de monitoreo continuo diseñado para identificar riesgos financieros y errores operativos en procesos contables.

### 🔐 Privacidad y Datos Sintéticos
Para este proyecto se utilizaron **datos sintéticos** generados mediante lógica de programación.
* **Anonimización**: Se aplicó **Data Masking** en proveedores y cuentas bancarias (Empresa A, B, C...).
* **Seguridad**: Los identificadores tributarios y montos son simulados para garantizar el secreto profesional.

### 🛠️ Stack Tecnológico
* **SQL (DBeaver/SQLite)**: Creación del esquema estrella y gestión de bases de datos.
* **Python (Pandas/Seaborn)**: Algoritmos de detección de facturas duplicadas y análisis de riesgos.
* **Power BI**: Dashboard ejecutivo para la visualización de KPIs de auditoría.

### 📊 Análisis Incluidos
1. **Detección de Anomalías**: Identificación de asientos desbalanceados y duplicados.
2. **Time Intelligence**: Análisis de variaciones mensuales (MoM) para detectar desvíos.

# 📊 Auditoría Operativa y Análisis de Sentimiento (ABSA) en Soporte al Cliente

![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![DAX](https://img.shields.io/badge/DAX-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)

> **Visualización interactiva y automatización del análisis de feedback de clientes para la toma de decisiones financieras y operativas.**

---

## 📑 Índice
1. [Contexto y Desafío de Negocio](#-contexto-y-desafío-de-negocio)
2. [Arquitectura del Proyecto](#-arquitectura-del-proyecto)
3. [Modelado de Datos (Power BI)](#-modelado-de-datos-power-bi)
4. [Métricas Clave (DAX)](#-métricas-clave-dax)
5. [Impacto Generado](#-impacto-generado)
6. [Cómo Ejecutar el Proyecto](#-cómo-ejecutar-el-proyecto)
7. [Autor](#-autor)

---

## 🎯 Contexto y Desafío de Negocio
El área de Soporte al Cliente suele acumular miles de registros cualitativos (texto libre) difíciles de auditar. El desafío de este proyecto fue **erradicar el procesamiento manual** y transformar ese feedback desestructurado en una métrica financiera dura: el **Costo Operativo**. 

El objetivo es permitir a la gerencia auditar rápidamente qué departamentos generan mayores pérdidas económicas debido a fricciones operativas (ej. demoras en entregas o errores de facturación).

---

## 🏗️ Arquitectura del Proyecto

El ecosistema se divide en dos fases tecnológicas para garantizar su escalabilidad:

### 1. Data Engineering & NLP (Back-end)
* **Generación y Simulación:** Se utilizó **Python** (Pandas, NumPy) para generar un *dataset* sintético que replica el estrés de una operación corporativa real, aplicando reglas de probabilidad y lógica de negocio.
* **ABSA (Aspect-Based Sentiment Analysis):** Se simuló un *pipeline* de procesamiento de lenguaje natural que lee el ticket y extrae automáticamente:
    * **Aspecto:** La entidad del reclamo (ej. "Demora en entrega").
    * **Sentimiento:** La polaridad del texto (Negativo, Neutro, Positivo).

### 2. Business Intelligence (Front-end)
* Se construyó un tablero ejecutivo en **Power BI** con un enfoque *Top-Down* (de la métrica macro al *drill-down* micro para los auditores).

---

## 🗄️ Modelado de Datos (Power BI)
Para maximizar el rendimiento del reporte, se implementó un **Esquema de Estrella (Star Schema)** puro con cardinalidad `1:*` y filtros unidireccionales:

* **Tabla de Hechos (Fact):** `Fact_Tickets` (Contiene las transacciones, IDs, Costo Operativo y Sentimiento).
* **Tablas de Dimensiones (Dim):** * `Dim_Calendario` (Para Time Intelligence).
    * `Dim_Departamentos` (Ventas, Logística, Facturación, etc.).
    * `Dim_Aspectos` (Categorización del problema).

---

## 🧮 Métricas Clave (DAX)
Las métricas se centralizaron en una tabla exclusiva `_Medidas` para mantener el orden del modelo. Destacan:

* **Costo Operativo Total:** Monetización del tiempo de resolución.
    ```dax
    Costo Operativo Total = SUM('Fact_Tickets'[Costo_Operativo_USD])
    ```
* **Time Intelligence (MoM):** Variación porcentual intermensual para control de gestión.
    ```dax
    Variacion Costo MoM % = DIVIDE([Costo Operativo Total] - [Costo Mes Anterior], [Costo Mes Anterior], 0)
    ```
* **% Sentimiento Negativo:** Aislamiento de la fricción real.
    ```dax
    % Sentimiento Negativo = DIVIDE(CALCULATE([Total Tickets], 'Fact_Tickets'[Sentimiento] = "Negativo"), [Total Tickets], 0)
    ```

---

## 🚀 Impacto Generado
El *Dashboard* permite al equipo directivo identificar instantáneamente los cuellos de botella. Por ejemplo, aísla visualmente el **59% de fricción operativa** concentrado en el departamento de Ventas y Logística, permitiendo focalizar las auditorías y reducir costos por retrabajo.

---

## ⚙️ Cómo Ejecutar el Proyecto
1. Clona este repositorio en tu entorno local:
   ```bash
   git clone [https://github.com/tu-usuario/auditoria-soporte-absa.git](https://github.com/tu-usuario/auditoria-soporte-absa.git)
