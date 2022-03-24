import subprocess as sb
import pandas as pd

df = pd.read_csv('https://raw.githubusercontent.com/Dattu219/ContractWard/main/OpenSourceContractInfo_without_code.csv')
df = df.loc[: , 'address']

for i in range(5):
    cmd = 'python oyente.py -ru https://raw.githubusercontent.com/Dattu219/ContractWard/main/sol_149363/' + df['address'][i]
    sb.check_call(cmd)