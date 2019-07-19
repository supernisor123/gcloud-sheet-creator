# gcloud-sheet-creator
An useful script that reduce the google cloud platform informations 


Requirments:

1.Linux based OS(with shell script)

2.gcloud command sdk:

https://cloud.google.com/sdk/install

3.Creating an googlesheet

![create](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/1_create.png)

### HOW TO USE
1. clone this project.

```git clone  https://github.com/supernisor123/gcloud-sheet-creator.git```

2. go to googleSheet and open Tools > Script editor. 

![open](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/2_open.png)

3. paste the gs code to Script editor.

![paste](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/3_paste.png)

![paste](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/4_paste.png)

4. publish the apps script.

![publish](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/5_publish.png)

![permission](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/6_permission.png)

![getlink](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/getlink.png)

5. change permission to shell scripts.

```sudo chmod +x gcloud-ip-list.sh```

6. run the script.  

```bash gclod-ip-list.sh```

This script will present google cloud platform instance data like this:

![example](https://github.com/supernisor123/gcloud-sheet-creator/blob/master/png/example.png)
