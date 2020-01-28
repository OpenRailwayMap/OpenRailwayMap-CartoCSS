#! /usr/bin/env python3

import argparse
import os
import os.path
import sys
import yaml

parser = argparse.ArgumentParser(
    description="""
Print the names of the .mss files used by a .mml file (CartoCSS style, YAML
format) and the name of the .mml file itself as a list of dependencies of a
Makefile. This script needs to be called from the directory where the Makefile
is located.""")
parser.add_argument(
    "-k",
    "--key",
    type=str,
    default="Stylesheet",
    help="Name of the YAML key on top level to query for"
)
parser.add_argument(
    "-n",
    "--not-replace-suffix",
    action="store_true",
    help="Do not replace file name suffix of the input filename by .mml"
)
parser.add_argument(
    "input_file",
    type=str,
    help="Input file"
)
args = parser.parse_args()

input_filename = args.input_file
if not args.not_replace_suffix:
    input_filename = "{}.{}".format(os.path.splitext(input_filename)[0], "mml")

if not os.path.isfile(input_filename) and not os.path.islink(input_filename):
    sys.stderr.write("Input file {} does not exist.\n".format(input_filename))
    exit(1)

# input_dir is an empty string if args.input_file is just a filename without a directory.
input_dir = os.path.dirname(args.input_file)

with open(input_filename, "rb") as input_file:
    mml = yaml.safe_load(input_file)
    mss_files = mml.get(args.key, [])
    if len(mss_files) == 0:
        sys.stderr.write("No stylesheets found\n")
        exit(1)
    # An empty string as directory does not make the result accidentially become an absolute path.
    mss_files = [ os.path.join(input_dir, m) for m in mss_files ]
    sys.stdout.write("{}.xml: ".format(os.path.splitext(input_filename)[0]))
    sys.stdout.write(" ".join(mss_files) + "\n")
