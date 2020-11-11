import os
import re
import glob
import shutil
import argparse


def find_libraries(lib_names):
    exts = ['a', 'so', 'lib', 'dll']
    pat = re.compile(r'(lib)?(\w+)\.(\w+)')
    for ext in exts:
        cands = glob.glob('**/*.{}'.format(ext))
        for cand in cands:
            mat = pat.match(os.path.basename(cand))
            if mat and mat.group(2) in lib_names:
                yield cand


def install_library(lib_path, dest_dir):
    if not os.path.exists(dest_dir):
        os.makedirs(dest_dir)
    if not os.path.isdir(dest_dir):
        print('Error: {} is not a dir'.format(dest_dir))
        return
    shutil.copy(lib_path, dest_dir)
    print('Installed {} to {}'.format(lib_path, dest_dir))


def main():
    parser = argparse.ArgumentParser(description='BoringSSL install script')
    parser.add_argument('--prefix', help='install directory prefix', default='/usr/local')
    args = parser.parse_args()
    # find and copy files
    libs = find_libraries(['crypto', 'ssl'])
    dest = os.path.join(args.prefix, 'lib')
    for lib in libs:
        install_library(lib, dest)


if __name__ == '__main__':
    main()
