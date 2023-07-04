![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Unsupervised learning intro

#### Instructions 
# Results of this lab can be found - modeling part [here](https://github.com/ainaraguerraf/Data_Analytics_bootcamp_labs/blob/main/UNIT%208%20-%20HTML%2C%20WEBSCRAPPING%2C%20APIS%2C%20CLUSTERING/5.%20lab-unsupervised-learning-intro/lab-unsupervised-learning-intro%20-%20ainara%20guerra.ipynb).

# The streamlit recommender code is [here](https://github.com/ainaraguerraf/Data_Analytics_bootcamp_labs/blob/main/UNIT%208%20-%20HTML%2C%20WEBSCRAPPING%2C%20APIS%2C%20CLUSTERING/5.%20lab-unsupervised-learning-intro/song_recommender_streamlit%20-%20improved.py).

![image](https://github.com/ainaraguerraf/Data_Analytics_bootcamp_labs/assets/115892160/f826f819-d793-4e88-bb98-71eca3daef7b)


It's the moment to perform clustering on the songs you collected. Remember that the ultimate goal of this little project is to improve the recommendations of artists. Clustering the songs will allow the recommendation system to limit the scope of the recommendations to only songs that belong to the same cluster - songs with similar audio features.

The experiments you did with the `Spotify` API and the Billboard web scraping will allow you to create a pipeline such that when the user enters a song, you:

1. Check whether or not the song is in the Billboard Hot 200.
2. Collect the audio features from the `Spotify` API.

After that, you want to send the `Spotify` audio features of the submitted song to the clustering model, which should return a cluster number.

We want to have as many songs as possible to create the clustering model, so we will add the songs you collected to a bigger dataset available on Kaggle containing 160 thousand songs.
