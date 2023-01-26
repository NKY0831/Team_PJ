rd$server$stop()

install.packages("KeyboardSimulator")


extractReview = function(clothes){
  
  library(rvest)
  library(RSelenium)
  library(KeyboardSimulator)

  rd = rsDriver(chromever = "106.0.5249.61", 4445L, 
                remoteServerAddr="localhost", check = F)
  
  remDr = rd$client
  
  remDr$navigate("https://www.musinsa.com/app/goods/640839")
  
  Sys.sleep(time = 10)
  
  mouse.move(1160,465, duration = 1)
  mouse.click()
  
  remDr$executeScript("window.scrollTo(0, 20000)")
  
  # 상품 일반 리뷰 접속
  elem1 = remDr$findElement(using = "css", value = "#estimate_goods")
  
  elem1$clickElement()
  
  Sys.sleep(time = 1)
  
  df_replies2 = data.frame()
  
  for (try in 1:3) {
    
    for (i in 1:5) {
      page = remDr$getPageSource()[[1]]
      
      remDr$executeScript("window.scrollTo(0, 13500)")
      
      Sys.sleep(time = 1)
      
      new_replies = read_html(page) %>% html_nodes(css="div.review-contents__text") %>% html_text()
      
      new_replies = str_trim(new_replies, side = "both")
      
      df_new_replies = data.frame(reply = new_replies)
      
      df_replies2 = rbind(df_replies2, df_new_replies)
      
      print(df_replies2)
      
      if (i == 5) {
        break
      }
      
      url_1 = '#reviewListFragment > div.nslist_bottom > div.pagination.textRight > div > a:nth-child('
      url_2 = ')'
      num = i + 3
      url_full = paste0(url_1, num, url_2)
      
      
      elem2 = remDr$findElement(using = "css", value = url_full)
    
      elem2$clickElement()
      
      Sys.sleep(time = 5)
      
    }
      elem3 = remDr$findElement(using = "css", value = "#reviewListFragment > div.nslist_bottom > div.pagination.textRight > div > a.fa.fa-angle-right.paging-btn.btn.next")
    
    elem3$clickElement()
    
  }
  rd$server$stop()

  saveReview(clothes, df_replies2)
  

}

saveReview = function(clothes, df_replies2){
  write.table(df_replies2, file=clothes, quote = T,
              row.names = F, col.names = c("reply"),
              fileEncoding = "utf-8", sep = ",")
              }




extractReview("무신사3.txt")
saveReview("무신사.txt")



rd$server$stop()

rd = rsDriver(chromever = "106.0.5249.61", 4445L, 
              remoteServerAddr="localhost")

remDr = rd$client


