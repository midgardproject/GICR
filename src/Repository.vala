
namespace GICR {

	public errordomain RepositoryError {
		INTERNAL
	}

	public interface Repository : GLib.Object {

		public abstract Session login (Credentials credentials, string? workspace_name) throws RepositoryError;

        public abstract string[] get_descriptor_keys ();

        public abstract bool is_standard_descriptor (string key);

        public abstract Value get_descriptor (string key);
			
	}
}

