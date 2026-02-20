-- 1. Creación de Dimensiones
CREATE TABLE Dim_Cuentas (
    CuentaID INT PRIMARY KEY,
    Codigo_Contable VARCHAR(20) UNIQUE,
    Nombre_Cuenta VARCHAR(100),
    Tipo_Cuenta VARCHAR(50) -- Activo, Pasivo, Patrimonio, Ingreso, Egreso
);

CREATE TABLE Dim_Proveedores (
    ProveedorID INT PRIMARY KEY,
    CUIT VARCHAR(20) UNIQUE,
    Nombre_Fantasia VARCHAR(100),
    Categoria_Riesgo VARCHAR(10) -- A, B, C (Auditoría interna)
);

-- 2. Tabla de Hechos (Fact Table)
CREATE TABLE Fact_Asientos (
    AsientoID SERIAL PRIMARY KEY,
    Fecha DATE NOT NULL,
    CuentaID INT REFERENCES Dim_Cuentas(CuentaID),
    ProveedorID INT REFERENCES Dim_Proveedores(ProveedorID),
    Debe DECIMAL(18, 2) DEFAULT 0,
    Haber DECIMAL(18, 2) DEFAULT 0,
    Nro_Factura VARCHAR(50),
    Usuario_Registro VARCHAR(50),
    Timestamp_Carga TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);