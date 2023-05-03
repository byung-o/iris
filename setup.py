#!/bin/env python

from setuptools import find_packages, setup

with open("requirements.txt", "r") as f:
    install_requires = f.readlines()

setup(
    name="iris",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    install_requires=install_requires,
    extras_require={
        "dev": [
            "black==22.8.0",
            "docformatter==1.5",
            "isort==5.10.1",
            "pylint==2.15.4",
            "pytest==7.1.3",
            "mypy==0.981",
            "mypy-extensions==0.4.3",
            "types-setuptools",
        ]
    }
)
