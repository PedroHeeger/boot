
from setuptools import setup, find_packages

with open("README.md", "r") as f:
    page_description = f.read()

with open("requirements.txt") as f:
    requirements = f.read().splitlines()

setup(
    name="pedro_image_processing",
    version="0.0.2",
    author="Pedro Heeger",
    author_email="teste@email.com",
    description="My short description",
    long_description=page_description,
    long_description_content_type="text/markdown",
    url="",
    #url="my_github_repository_project_link",
    packages=find_packages(),
    install_requires=requirements,
    python_require=">=3.8"
)