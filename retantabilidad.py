import sqlite3
import pandas as pd
import matplotlib.pyplot as plt

conn = sqlite3.connect("Nortwind.db")
# OBTENIENDO LOS 10 PRODUCTOS MAS RENTABLES 
query = """ 
    SELECT ProductName, SUM( Price * Quantity) as Revenue
    FROM OrderDetails od 
    JOIN Products p ON p.ProductID = od.ProductId
    GROUP BY od. ProductID
    ORDER BY Revenue DESC
    LIMIT 10
"""
top_products = pd.read_sql_query(query,conn)
top_products.plot(x="ProductName",y="Revenue",kind="bar",figsize=(10,5),legend=False)
plt.title("10 productos mas rentables")
plt.xlabel("Products")
plt.ylabel("Revenue")
plt.xticks(rotation=90)
plt.show()
# print(top_products)


# OBTENIENDO LOS 10 EMPLEADOS  MAS EFECTIVOS 
query2 =   """ 
   SELECT FirstName || "" || LastName as Employee, COUNT(*) as total
   FROM Orders o
   JOIN Employees e
   ON e.EmployeeID = o.EmployeeID
   GROUP BY o.EmployeeID
   ORDER BY Total ASC
   LIMIT 3 

"""
top_products = pd.read_sql_query(query2,conn)
top_products.plot(x="Employee",y="total",kind="bar",figsize=(10,5),legend=False)
plt.title("10 Empleados mas efectivos")
plt.xlabel("Empleados")
plt.ylabel("Total vendido")
plt.xticks(rotation=45)
plt.show()
