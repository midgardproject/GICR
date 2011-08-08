
namespace GICR {

	public interface Session : GLib.Object {

		public abstract Repository get_repository ();
		public abstract string? get_user_id ();
		public abstract string[] get_attribute_names () ;
		public abstract Value get_attribute_name(string name);
		public abstract Workspace? get_workspace ();
		public abstract Node get_root_node ();
		public abstract Session impersonate();
		public abstract Node get_node_by_identifier (Value id);
		public abstract Item get_item (string path);
		public abstract bool item_exists (string path);
		public abstract void move (string srcPath, string destPath);
		public abstract void remove (string path);
		public abstract void save ();
		public abstract void refresh ();
		public abstract bool has_pending_changes ();
	}
}

