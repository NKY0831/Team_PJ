# install.packages("KeyboardSimulator") 필요

## 데이터 수집 함수 ##
musinsa_review = function(site,review_page,dataname){
  
  library(RSelenium)
  library(rvest)
  library(KeyboardSimulator)
  
  rd = rsDriver(chromever = "106.0.5249.61",4445L,remoteServerAddr="localhost",check = F)
  
  remDr = rd$client
  
  remDr$navigate(site)  
  
  remDr$maxWindowSize()
  
  Sys.sleep(10)
  
  mouse.move(1160,465, duration = 1)
  mouse.click()
  
  findelem = remDr$findElement(using = "css", value = "#estimateBox > div.tabBox > ul > li.box-tab-btn.tab-btn.btn.active")
  
  findelem$clickElement()
  
  Sys.sleep(3)
  
  df_review = data.frame()
  
  pagenum = review_page%/%5
  rest_pagenum = review_page%%5
  
  for (i in rep(0:5,times = pagenum)) {
    
    if (i == 5) { 
      
      review_click_next_page_elem = remDr$findElement(using = "css", value = "#reviewListFragment > div.nslist_bottom > div.pagination.textRight > div > a.fa.fa-angle-right.paging-btn.btn.next")
      
      review_click_next_page_elem$clickElement()
      
      Sys.sleep(2)
    } else{
      
      url_1 = '#reviewListFragment > div.nslist_bottom > div.pagination.textRight > div > a:nth-child('
      num = i+3
      url_2 = ')'
      value.data = paste0(url_1,num,url_2)
      
      review_click_page_elem = remDr$findElement(using = "css", value = value.data)
      
      review_click_page_elem$clickElement()
      
      Sys.sleep(2)
      
      page = remDr$getPageSource()[[1]]
      
      review = read_html(page) %>% 
        html_nodes("div.review-list div.review-contents div.review-contents__text") %>%
        html_text()
      
      review = str_trim(review, side = "both")
      
      df_new_review = data.frame(review_list = review)
      
      df_review = rbind(df_review , df_new_review)
      
      Sys.sleep(2)
      
    }
  }
  for (y in 0:(rest_pagenum-1)) {
    
    if(rest_pagenum == 0){
      
      break
      
    }else{
      
      url_1 = '#reviewListFragment > div.nslist_bottom > div.pagination.textRight > div > a:nth-child('
      num = y+3
      url_2 = ')'
      value.data = paste0(url_1,num,url_2)
      
      review_click_page_elem = remDr$findElement(using = "css", value = value.data)
      
      review_click_page_elem$clickElement()
      
      Sys.sleep(2)
      
      page = remDr$getPageSource()[[1]]
      
      review = read_html(page) %>% 
        html_nodes("div.review-list div.review-contents div.review-contents__text") %>%
        html_text()
      
      review = str_trim(review, side = "both")
      
      df_new_review = data.frame(review_list = review)
      
      df_review = rbind(df_review , df_new_review)
      
      Sys.sleep(2)
    }
  }
  rd$server$stop()
  write.table(df_review,file = dataname, quote = T, row.names = F, col.names = c("review_list"), fileEncoding = "utf-8", sep = ",")
}

## 데이터 수집 사용 ##
## url주소, 리뷰페이지수, txt 파일명
musinsa_review("https://www.musinsa.com/app/goods/2038497",
               13,
               "오버 럭비 맨투맨.txt")




## 전처리 함수 ##
pre_musinsa = function(dataname){
  library(readr)
  data_table = read.table(file = dataname,sep = ",", fileEncoding = "utf-8", col.names = c("reply"), header = T)
  data_table$reply = str_replace_all(data_table$reply,"\\W"," ")

}

## 전처리 함수 사용
## txt 파일명
pre_musinsa_data = pre_musinsa("오버 럭비 맨투맨.txt")
pre_musinsa_data

# 전처리 저장
write.table(pre_musinsa_data, file="오버 럭비 맨투맨2.txt", quote = T,
            row.names = F, col.names = c("reply"),
            fileEncoding = "utf-8", sep = ",")


## 분석 함수 ##
anal_musinsa = function(article,word_size,fil_word){
  library(dplyr)
  article_nouns <- str_split(article, " ")
  article_count <- table(unlist(article_nouns))
  df_article<- as.data.frame(article_count, stringsAsFactors = F)
  head(df_article)
  df_article<- rename(df_article,
                      word = Var1,
                      freq = Freq)
  df_article<- filter(df_article,nchar(word)>=word_size)
  df_article_ft = df_article %>%  filter(!word == fil_word)
  df_article_arr = df_article_ft %>% arrange(desc(freq))

}
## 분석 함수 사용
## 데이터명, 음절 크기, 필요없는 단어 삭제
anal_musinsa_data = anal_musinsa(pre_musinsa_data,3,"NA")
anal_musinsa_data

# 분석 저장
write.xlsx(anal_musinsa_data, "오버 럭비 맨투맨3.xlsx", sheetName = "sheet1", col.names = T, row.names = T)

## 시각화 함수 및 wordcloud 저장 ##
vis_musinsa = function(dataname,Filename){
  library(wordcloud)
  pal<- brewer.pal(8,"Dark2")
  imgFile = Filename
  windows()
  wordcloud(words = dataname$word,
            freq = dataname$freq,
            min.freq = 2,
            max.words = 500,
            random.order = F,
            rot.per = .1,
            colors = pal,
            scale = c(5,0.2))
  savePlot(imgFile, type = "png")
}
## 시각화 함수 사용
## 데이터명, 파일 저장명
vis_musinsa(anal_musinsa_data,"헤비 코튼 오버 럭비 맨투맨_WC.png")




## 시각화 함수2 및 빈도 그래프 저장
vis2_musinsa = function(Filename2,numb){
  
  anal_musinsa_data_head = anal_musinsa_data %>% arrange(desc(freq)) %>% head(numb)
  
  plot_ms = ggplot(data = anal_musinsa_data_head, aes(x=reorder(word,freq), y=freq)) + 
    
    geom_col() + 
    
    coord_flip() +
    
    labs(x = "단어", y="빈도",
         
         caption = "무신사 홈페이지") + 
    
    theme(plot.title = element_text(hjust = 0.5))
  
  ggsave(file=Filename2, plot=plot_ms)
  
}
## 시각화 함수2 사용(파일명, 단어 출력갯수)
vis2_musinsa("헤비 코튼 오버 럭비 맨투맨_Plot.png",50)

