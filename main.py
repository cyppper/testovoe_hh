from flask import Flask, jsonify
import config
import os

app = Flask(__name__)


def add_element(list_to_add, filename, filetype):
    list_to_add.append(
        {
            "name": str(filename),
            "type": str(filetype),
            "time": int(os.path.getctime(config.directory + '/' + filename))
        }
    )


@app.route('/api/meta', methods=['GET'])
def meta():
    data = []
    all_files_in_dir = os.listdir(config.directory)
    for filename in all_files_in_dir:
        if os.path.isfile(config.directory + '/' + filename):
            add_element(data, filename, 'file')
        else:
            add_element(data, filename, 'folder')
    return jsonify({"data": data})


if __name__ == '__main__':
    app.run()
