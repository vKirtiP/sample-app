
# sample-app

To deploy a Hello world app in Python using GitHub Actions




## Deployment

- Setup GitHub Repository:
    - Create a new GitHub repository
- clone the repo in the local system

- create a basic python app

![App Screenshot](https://github.com/vKirtiP/sample-app/blob/main/results/image_step_1.png)

- Deploying on ec2 instance

    - Create an EC2 instance where you want to deploy sample app.
    - while creating an instance make sure to add ssh port in security group so, when github actions perform it can access the instance for deploy

![App Screenshot](https://github.com/vKirtiP/sample-app/blob/main/results/iamge_step_2.png)

- GitHub Actions Workflow

    - Create a **.github/workflows** directory in your repository if it doesn't exist.
    - Create a new YAML file **deploy.yml** in the .github/workflows directory.

    - **actions/checkout@v3** step checks out the repository code.
    - **actions/setup-python@v3** step sets up Python 3.10.
    - **Install dependencies** step upgrades pip, installs flake8 and pytest, and installs additional dependencies from requirements.txt if it exists.
    - Add **EC2 host key** to **known hosts** step adds the EC2 instance's host key to the known hosts file to establish secure connections later.
    - **Deploy to EC2** step performs the actual deployment to the EC2 instance:
        - using the **EC2_INSTANCE_IP** and **EC2_SSH_PRIVATE_KEY** environment variables to set the instance IP and SSH private key (stored in **GitHub secrets**).
        - creating a temporary **key.pem** file, saves the private key into it, and sets its permissions.
        - Adding the **EC2 host** key to the known hosts again.
        - Using **scp** to copy the **app.py** file to the **EC2 instance**.
        - using **ssh** to run a Python command on the **EC2 instance**, executing **app.py**.
        - Finally, it cleans up the temporary **key.pem** file.

## Screenshots

![App Screenshot](https://github.com/vKirtiP/sample-app/blob/main/results/image_step_3.png)

