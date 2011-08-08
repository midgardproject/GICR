namespace GICR {

    public interface Item : GLib.GObject {

        public abstract void set_value (Value value, int? type) throws RepositoryError, ValueError;

        public abstract void add_value (Value value) throws ValueError;

        public abstract Value get_value ();

        public abstract string get_string () throws RepositoryError, ValueError;

        /*
         public abstract GioStream get_binary () throws RepositoryError, ValueError;
        */

        public abstract long get_long () throws RepositoryError, ValueError;

        public abstract double get_double () throws RepositoryError, ValueError;

        public abstract float get_decimal () throws RepositoryError, ValueError;

        /*
         public abstract datetime get_date () throws RepositoryError, ValueError;
        */

        public abstract bool get_boolean () throws RepositoryError, ValueError;

        public abstract Node get_node () throws RepositoryError, ItemError;

        public abstract Property get_property () throws RepositoryError, ItemError;

        public abstract int get_length () throws RepositoryError;

        /*
         public abstract PropertyDefinition get_definition () throws RepositoryError;
        */

        public abstract int get_type () throws RepositoryError;

        public abstract bool is_multiple () throws RepositoryError;

    }

}
