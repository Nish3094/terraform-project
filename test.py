import json

try:
    with open('append.json', 'r') as fin:
        data = json.load(fin)
except FileNotFoundError as exc:
    pass

try:
    if data:
        with open('data1.json', 'r') as med:
            data1 = json.load(med)
        data.append(data1)
        with open('append.json', 'w') as fout:
            json.dump(data, fout)
except UnboundLocalError as exc:
    with open('append.json', 'w') as fout:
        json.dump(data, fout)
