import pandas as pd
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
import nltk
nltk.download('punkt')


# load data into df
df = pd.read_csv("df_clean.csv")

# instantiate vader analyzer obj
sent_analyzer = SentimentIntensityAnalyzer()

# define dict for keywords
# have both negative and positive in the list since vader scores each word for its sentiment polarity
keyword_dict = {
    "cleanliness": ["clean", "tidy", "dirty", "filthy", "hygienic", "messy", "spotless", "pristine", "neat", "dusty", "smelly"],
    "location": ["convenient", "accessible", "far", "near", "walkable", "central", "close to", "isolated", "remote", "reachable"],
    "safety": ["safe", "dangerous", "sketchy", "secure", "risky", "crime", "well-lit"]
}

# add binary columns for each aspect -- might be useful for later?
# but not explicitly using them in the sentiment analysis portion
def check_review_for_cleanliness(review):
    for val in keyword_dict["cleanliness"]:
        if val in review.lower():
            return 1
    return 0
def check_review_for_safety(review):
    for val in keyword_dict["safety"]:
        if val in review.lower():
            return 1
    return 0
def check_review_for_location(review):
    for val in keyword_dict["location"]:
        if val in review.lower():
            return 1
    return 0


df["cleanliness"] = df["comments"].apply(check_review_for_cleanliness)
df["safety"] = df["comments"].apply(check_review_for_safety)
df["location"] = df["comments"].apply(check_review_for_location)

# only call analyzer on sentences related to aspect, otherwise return none
# help from chatgpt
def get_compound_sentiment(review, aspect):
    sentences = nltk.sent_tokenize(review)

    related_sentences = []
    for sentence in sentences:
        for word in keyword_dict[aspect]:
            if word in sentence.lower(): # if the keyword is in the entire string
                related_sentences.append(sentence)
                break
    # first join the sentences related to an aspect into a single string
    aspect_str = " ".join(related_sentences).strip()

    if len(aspect_str) > 0:
        return sent_analyzer.polarity_scores(aspect_str)['compound']
    return None


# apply function to all rows
# lambda function to pass in both the review nad the aspect as args to the function get_compound_sentiment
for aspect in keyword_dict:
    df[f'{aspect}_sent_compound'] = df["comments"].apply(lambda x: get_compound_sentiment(x, aspect))
filter_cl = df["cleanliness_sent_compound"].isna()
print("number of NAs for cleanliness compound: ", filter_cl.sum())
filter_sa = df["safety_sent_compound"].isna()
print("number of NAs for safety compound: ", filter_sa.sum())
filter_lo = df["location_sent_compound"].isna()
print("number of NAs for location compound: ", filter_lo.sum())
print("total rows in dataset: ", df.shape[0])

print(df.head(20))

# get overall sentiment 
def get_overall_sent(review):
    return sent_analyzer.polarity_scores(review)['compound']


df["overall_sent_compound"] = df["comments"].apply(get_overall_sent)
print(df["cleanliness_sent_compound"])




