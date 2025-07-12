# -------------------------------------------------------------------
# 文件: tool\py_convert_encoding.py
# 作者: shyfan
# 日期: 2025/02/13 15:13:06
# 功能: 修改文件编码
# -------------------------------------------------------------------
import os
import sys
import chardet


def detect_encoding(file_path):
    """检测文件的编码格式"""
    with open(file_path, "rb") as f:
        result = chardet.detect(f.read())
    return result["encoding"]


def convert_encoding(file_path, src_encoding, dest_encoding):
    """转换文件编码"""
    try:
        with open(file_path, "r", encoding=src_encoding) as f:
            content = f.read()
        with open(file_path, "w", encoding=dest_encoding) as f:
            f.write(content)
        print(f"Converted: {file_path} ({src_encoding} -> {dest_encoding})")
    except Exception as e:
        print(f"Failed to convert {file_path}: {e}")


def process_directory(directory, extensions, dest_encoding):
    """递归处理目录中的文件"""
    for root, _, files in os.walk(directory):
        for file in files:
            if any(file.endswith(ext) for ext in extensions):
                file_path = os.path.join(root, file)
                src_encoding = detect_encoding(file_path)
                if src_encoding and src_encoding.lower() != dest_encoding.lower():
                    convert_encoding(file_path, src_encoding, dest_encoding)
                else:
                    print(f"Skipping: {file_path} (Encoding: {src_encoding})")


if __name__ == "__main__":
    if len(sys.argv) < 4:
        print(
            "用法: python convert_encoding.py <文件夹路径> <扩展名,逗号分隔> <目标编码>"
        )
        sys.exit(1)

    folder_path = sys.argv[1]
    extensions = sys.argv[2].split(",")
    target_encoding = sys.argv[3]

    print(f"开始转码: {folder_path} {extensions} -> {target_encoding}")

    process_directory(
        folder_path.strip(),
        [ext.strip() for ext in extensions],
        target_encoding.strip(),
    )
