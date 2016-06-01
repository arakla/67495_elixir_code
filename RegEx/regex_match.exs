RegExp.basic("eat") #true
RegExp.basic("dsfg") #false
RegExp.basic("treat") #true
RegExp.basic2("treat") #false
RegExp.basic3("treat") #false
RegExp.basic2("eatzzz") #true
RegExp.basic3("eatzzz") #false
RegExp.basic3("eat") #true
RegExp.basic3("I eat") #false
RegExp.is_email("12ARakla@gmail.com") #false
RegExp.is_email2("12ARakla@gmail.com") #true
RegExp.is_email("arakla@andrew.cmu.edu") #false
RegExp.is_email2("arakla@andrew.cmu.edu") #true
RegExp.is_email("blah") #false
RegExp.is_email2("blah") #false
RegExp.is_email("john@doe") #false
RegExp.is_email2("john@doe") #false
