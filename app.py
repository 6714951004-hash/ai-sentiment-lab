import streamlit as st
from textblob import TextBlob

# ตั้งค่าหน้ากระดาษ
st.set_page_config(page_title="My AI Lab", page_icon=":brain:")

st.title(":brain: AI for Sentiment Analysis")
st.write("Enter an English message in the box below, and AI will determine whether it's Positive or Negative.")

# ช่องรับข้อมูล
text_input = st.text_area("Input Text (English only):", height=150)

if st.button("Analyze"):
    if text_input:
        # คำนวณ Sentiment
        blob = TextBlob(text_input)
        score = blob.sentiment.polarity
        
        st.divider()
        
        # แสดงผลลัพธ์ตามคะแนนที่ได้
        # score > 0 คือ Positive, score < 0 คือ Negative, score = 0 คือ Neutral
        if score > 0:
            st.success(f"### Result: Positive 😊")
            st.write(f"Sentiment Score: **{score:.2f}**")
        elif score < 0:
            st.error(f"### Result: Negative 😟")
            st.write(f"Sentiment Score: **{score:.2f}**")
        else:
            st.info(f"### Result: Neutral 😐")
            st.write(f"Sentiment Score: **{score:.2f}**")
            
    else:
        st.warning("Please enter some text to analyze.")