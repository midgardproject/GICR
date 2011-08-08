namespace GICR {

    public errordomain ItemError {
        PATH_NOT_FOUND,
        ITEM_NOT_FOUND
    }

    public interface Item : GLib.GObject {

        public abstract string get_path ();

        public abstract string get_name ();

        public abstract Item get_ancestor (int depth);

        public abstract Item get_parent ();

        public abstract int get_depth ();

        public abstract Session get_session ();

        public abstract bool is_node ();

        public abstract bool is_new ();

        public abstract bool is_modified ();

        public abstract bool is_same (Item other_item);

        public abstract void refresh (bool keep_changes);

        public abstract void remove ();

    }
}
