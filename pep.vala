using Gee; //library

public class Koko {
    public string key;
    public string value;

    public Koko(string key, string value){
        this.key = key;
        this.value = value; // why we need to define again? using the "="
    }
    public void print_koko(){ //print_koko, is it a variable or a command?
        print("%s: %s \n", this.key, this.value);
    }
}

//entries
public class Inside{
    public UnrolledLinkedList<Koko> values;
    public int64 created; //int64 is used for using gee extention get_real_time
    public int64 updated;

    public Inside(){
        this.values = new UnrolledLinkedList<Koko>();
        //calling the get real time library:
        created = get_real_time(); //it's in miliseconds, we may change it to seconds by deviding it using / 1000, and add / 60 if we wanna turn it into minutes
        updated = get_real_time();
    }

    public void add(Koko mi){ //created is already recorded deafult from the library, while for the updated func needs to be specified
        this.values.add(mi);
        this.updated = get_real_time();
    }

    public void print_values(){ //command or variable?
        print("[Created At: %lld \n]", this.created);//like string and int who uses %s n %d to call the object, the timestamp uses %lld
        print("[Updated At: %lld \n]", this.updated);
        foreach(Koko item in this.values){
            item.print_koko();
        }
    }

    public Koko get_value(string key){ // get_value is a command/ variable
        foreach(Koko item in this.values){
            if(item.key == key){
                print("[%s: %s\n]", item.key, item.value)
                return item;
                //this code shows that if we type in a specific key, it will also print the value of that key, inside the same entry. 
            }
        }
        print("[Value not Found!]");
        return null;
        //^^ print this when we dont find the same key = value not found
    } 

    public UnrolledLinkedList<Koko> get_value_by_keys(UnrolledLinkedList<string> keys){ //get_value_by_keys function is to get the value by typing the key of the desired value 
        UnrolledLinkedList<Koko> result = new UnrolledLinkedList<Koko>();
        foreach(string key in keys){
            foreach(Koko item in this.valus){
                //input the value that the key is in the parameter
                if(item.key == key){
                    print("%s \n", item.value);
                    result.add(item);
                    break;
                }
            }
        }
        return result //ionno what this is for
    }
}

public class Document{
    public UnrolledLinkedList<Inside> entries;
    public string name;
    public int64 created;
    public int64 updated;
    public static int index = 0; //what is this for?

    public Document(string name){
        this.name = name;
        this.entries = new UnrolledLinkedList<Inside>();
        //calling the get real time library
        created = get_real_time();
        updated = get_real_time();
    }

    public void add(Inside body){ //unique id (auto num)
        Koko id = new Koko("Unique ID:", this.index.to_string());
        body.add(id);
        this.entries.add(body);
        this.index += 1;
    }

    public void print_entries(){
        foreach(Inside body in this.entries){
            content.print_values();
            print("\n")
        }
    }
}

//making documents and inputting entries:
void main(){

    //Document 1
    Koko mi1 = new Koko("Username", "Lapep")
    Koko mi2 = new Koko("Age", "19")
    Koko mi3 = new Koko("Phone_Num", "08473653238942")
    Koko mi4 = new Koko("From", "Heaven")
    Koko mi5 = new Koko("Fav Genshin Char", "Kokomi")

    Inside entry1 = new Inside();
    entry1.add(mi1);
    entry1.add(mi2);
    entry1.add(mi3);
    entry1.add(mi4);
    entry1.add(mi5);

    Document d1 = new Document([DOKUMEN 1])
}


