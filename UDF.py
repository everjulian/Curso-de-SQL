import sqlite3
import pandas as pd 
# Funciones hechas por el usuario
square = lambda n : n *n 
with sqlite3.connect("Nortwind.db") as conn:
    conn.create_function("square",1,square)
    cousor = conn.cursor()
    cousor.execute( """
     SELECT * FROM Products                   
  """     
    )
    results = cousor.fetchall()
    results_df= pd.DataFrame(results)
    
print(results_df)

# Una forma de connectar 
# print (square(10))
# conn = sqlite3.connect("Nortwind.db")
# conn.create_function("square",1,square)
# cousor = conn.cursor()
# cousor.execute( """
#     SELECT * FROM Products                   
#   """     
#     )
# results = cousor.fetchall()
# results_df= pd.DataFrame(results)
# conn.commit()
# cousor.close()
# conn.close()
# print(results_df)