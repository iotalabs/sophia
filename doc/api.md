# API

## V1

### Auth

#### /signup

注册用户

Method: POST

Request:

- username:string
    - required=true
    - max_length=16
    - pattern=[^\s]
    - unique=true
    - trim=true
- nickname:string
    - required=false
- email:string
    - required=true
    - pattern=email
- password:string
    - required=true
    - max_length=16
- password2:string
    - required=true
    - equal_to=password

Response:

- status:string ok|error
- message:string Success or Error message
- errors:array # When status are error
    - field: Field_name
    - code: Error code
    - error: Error message

### /signin
### /signout
### /me
#### /users/:user

### Built-In

#### /dictionary

- 词典

#### /vocabulary

- 词汇

#### /vocabulary/:grade

- 词汇分级

#### /etyma

- 词源

#### /wordnet

- 词网

### User

#### 用户参与的API

#### /users/:user/browse

- 浏览记录

用户打开一个网站，
记录打开的URL，
浏览时间，
跳出时间，
浏览的位置，
屏幕滚动时间间隔。

Request:

- url:string
- content:text,required=false
- position:object,required=false
    - row:integer
      col:integer
- browse_at:datetime
- exit_at:datetime

#### /users/:user/lookup

- 查单词

当用户遇到不认识的单词时，
会查询一下单词，
这时候需要记录查询哪个单词，
上下文关系，
出现在哪个位置。
如果查询的单词是通过词标签来的，
需记录这个单词与上个词的关系。

Request:

- url:string,required=false
- word:string,required=true
- position:object,required=false
    - row:integer
      col:integer
- tags:array,required=false
    - relationship:string synonym|root|etyma
      word:string

#### 历史记录查询API

#### /users/:user/vocabulary

- 词汇量
- 词汇云

#### /users/:user/history/browse

- 浏览历史记录

#### /users/:user/history/vocabulary

- 查单词记录记录

#### /users/:user/behavior/browse

- 阅读时间
- 阅读速度
- 滚屏滚动时间
- 停留时间

#### /users/:user/behavior/vocabulary

- 查单词时间
- 查单词次数
