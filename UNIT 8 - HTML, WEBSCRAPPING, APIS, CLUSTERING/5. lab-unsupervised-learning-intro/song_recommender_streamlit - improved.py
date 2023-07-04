import pandas as pd
from scipy.spatial.distance import cdist
import streamlit as st

def recommend_song():
    # dataframes
    scaled_pe = pd.read_csv('scaled_pe.csv')
    scaled_pa = pd.read_csv('scaled_pa.csv')

    # Get user input for a song from the present
    present_song = st.text_input("Enter a popular song from the present:")

    # Check if the song exists in the present list
    if present_song not in scaled_pe['song'].values:
        st.write("We didn't find this song, maybe it is not so famous right now? Try with another song.")
        return

    # Get the numeric features for the present song
    present_song_features = scaled_pe.loc[scaled_pe['song'] == present_song, 'danceability':'tempo'].values

    # Compute the similarity between the present song and the past songs
    distances = cdist(present_song_features, scaled_pa.loc[:, 'danceability':'tempo'].values, metric='euclidean')
    closest_song_index = distances.argmin()
    closest_song = scaled_pa.loc[closest_song_index, 'song']

    st.write(f"Knowing that you like '{present_song}', you should for sure listen to this classic hit: '{closest_song}'🎶.")

# Create the Streamlit app
def main():
    st.title("Past features Present | Song Recommender 🪄")

    recommend_song()

if __name__ == "__main__":
    main()
