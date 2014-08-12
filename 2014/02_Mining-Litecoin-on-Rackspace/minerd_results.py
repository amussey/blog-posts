import os
import sys
import zipfile
import json


result_dir = os.path.dirname(os.path.realpath(sys.argv[0])) + '/results/'
result_dir_contents = os.listdir(result_dir)
result_zips = [x.replace('-ltc_results.zip', '') for x in result_dir_contents if '-ltc_results.zip' in x]

for result_zip in result_zips:
    with zipfile.ZipFile(result_dir + result_zip + '-ltc_results.zip', "r") as z:
        if not os.path.isdir(result_dir + result_zip):
            os.makedirs(result_dir + result_zip)
            z.extractall(result_dir + result_zip)

result_dir_contents = os.listdir(result_dir)
result_dirs = [x for x in result_dir_contents if os.path.isdir(result_dir + x)]

result_json = []

for result_set in result_dirs:
    result_files = os.listdir(result_dir + result_set)
    result_set_info = result_set.split('-')
    result_bits = 32
    if '64-bit.txt' in result_files:
        result_bits = 64
    result_files = [x for x in result_files if 'minerd_' in x and '_thread.txt' in x]

    result_threads = {}
    for result_file in result_files:
        with open(result_dir + result_set + '/' + result_file) as f:
            lines = f.read().splitlines()
            lines = [float(x[29:].replace(' khash/s', '')) for x in lines if 'Total: ' in x]
            thread_count = result_file.replace('minerd_', '').replace('_thread.txt', '')
            average = (reduce(lambda x, y: x + y, lines) / len(lines))
            result_threads[thread_count] = average

    result_json.append({
        'hostname': result_set,
        'threads': result_threads,
        'bits': result_bits,
        'datacenter': result_set_info[1] if 1 < len(result_set_info) else 'unknown',
        'os': result_set_info[2].replace('_', '') if 2 < len(result_set_info) else 'unknown',
        'pvhvm': ('pvhvm' in (result_set_info[3] if 3 < len(result_set_info) else '')),
        'ram': result_set_info[4] if 4 < len(result_set_info) else 'unknown'
    })

print json.dumps(result_json)
