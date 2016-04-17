FORMAT: 1A

# 交互类API

交互类API，如查字典，标注，笔记和浏览记录。

# 交互类

## 查字典 [/lookup]

### 查询单词 [POST]

+ Request JSON Message

    + Headers

        Accept: application/json
        X-Iota-Token: Authorized Token

    + Body

        {
            "lookup": {
                "user_id": "",
                "url": "",
                "word": "",
                "position": "",
                "source": "",
                "relationship": ""
            }
        }

+ Response 200 (application/json)

    + Headers

        Accept: application/json

    + Body

        {
            "status":"ok",
            "results": [
                {
                    "word": "",
                    "mean": ""
                }
            ]
        }

## 标注 [/annotate]

### 新增标注 [POST]

+ Request JSON Message

    + Headers

        Accept: application/json
        X-Iota-Token: Authorized Token

    + Body

        {
            "annotate": {
                "user_id": "",
                "url": "",
                "text": "",
                "position": ""
            }
        }

+ Response 201 (application/json)

## 做笔记

### 新增标注 [POST]

+ Request JSON Message

    + Headers

        Accept: application/json
        X-Iota-Token: Authorized Token

    + Body

        {
            "note": {
                "user_id": "",
                "url": "",
                "text": "",
                "position": ""
            }
        }

+ Response 201 (application/json)

## 浏览记录

### 记录浏览网页 [POST]

+ Request JSON Message

    + Headers

        Accept: application/json
        X-Iota-Token: Authorized Token

    + Body

        {
            "browse": {
                "user_id": "",
                "url": "",
                "text": "",
                "position": "",
                "enter_at": "",
                "leave_at": ""
            }
        }

+ Response 201 (application/json)
