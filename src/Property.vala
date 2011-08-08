namespace GICR {

    public interface Item : GLib.GObject {

        public abstract void set_value (Value value, int? type);

        public abstract void add_value (Value value);

        public abstract Value get_value ();

        public abstract string get_string ();

        /*
         public abstract GioStream get_binary ();
        */

        public abstract long get_long ();

        public abstract double get_double ();

        public abstract float get_decimal ();

        /*
         public abstract datetime get_date ();
        */

        public abstract bool get_boolean ();

        public abstract Node get_node ();

        public abstract Property get_property ();

        public abstract int get_length ();

        /*
         public abstract PropertyDefinition get_definition ();
        */

        public abstract int get_type ();

        public abstract bool is_multiple ();

    }

}
