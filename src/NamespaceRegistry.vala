/* 
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

namespace GICR {

	/**
	 * Defines an interface to implement a single namespace registry.
	 *
	 * Each repository has a single, persistent namespace registry represented by
	 * the NamespaceRegistry object, accessed via WorkspaceInterface::getNamespaceRegistry().
	 * The namespace registry contains the default prefixes of the registered
	 * namespaces. The namespace registry may contain namespaces that are not used
	 * in repository content, and there may be repository content with namespaces
	 * that are not included n the registry.
	 */
	public interface NamespaceRegistry : Object {

		/**
		 * A constant for the predefined namespace prefix "jcr".
		 */
		public const string PREFIX_JCR = "jcr";

		/**
		 * A constant for the predefined namespace prefix "nt".
		 */
		public const string PREFIX_NT = "nt";

		/**
		 * A constant for the predefined namespace prefix "mix".
		 */
		public const string PREFIX_MIX = "mix";

		/**
		 * A constant for the predefined namespace prefix "xml".
		 */
		public const string PREFIX_XML = "xml";

		/**
		 * A constant for the predefined namespace prefix "" (the empty prefix).
		 */
		public const string PREFIX_EMPTY = "";

		/**
		 * A constant for the predefined namespace mapped by default to the prefix "jcr"
		 */
		public const string NAMESPACE_JCR = "http://www.jcp.org/jcr/1.0";

		/**
		 * A constant for the predefined namespace mapped by default to the prefix "nt"
		 */
		public const string NAMESPACE_NT = "http://www.jcp.org/jcr/nt/1.0";

		/**
		 * A constant for the predefined namespace mapped by default to the prefix "mix"
		 */
		public const string NAMESPACE_MIX = "http://www.jcp.org/jcr/mix/1.0";

		/**
		 * A constant for the predefined namespace mapped by default to the prefix "xml"
		 */
		public const string NAMESPACE_XML = "http://www.w3.org/XML/1998/namespace";

		/**
		 * A constant for the predefined namespace mapped by default to the prefix "" (the empty prefix)
		 */
		public const string NAMESPACE_EMPTY = "";

		/**
		 * Sets a one-to-one mapping between prefix and uri in the global namespace
		 * registry of this repository.
		 * Assigning a new prefix to a URI that already exists in the namespace
		 * registry erases the old prefix. In general this can almost always be
		 * done, though an implementation is free to prevent particular
		 * remappings by throwing a NamespaceException.
		 *
		 * On the other hand, taking a prefix that is already assigned to a URI
		 * and re-assigning it to a new URI in effect unregisters that URI.
		 * Therefore, the same restrictions apply to this operation as to
		 * NamespaceRegistry.unregisterNamespace():
		 * * Attempting to re-assign a built-in prefix (jcr, nt, mix, sv, xml,
		 * or the empty prefix) to a new URI will throw a
		 * NamespaceException.
		 * * Attempting to register a namespace with a prefix that begins with
		 * the characters "xml" (in any combination of case) will throw a
		 * NamespaceException.
		 * * An implementation may prevent the re-assignment of any other namespace
		 * prefixes for implementation-specific reasons by throwing a
		 * NamespaceException.
		 *
		 * @param prefix The prefix to be mapped.
		 * @param uri The URI to be mapped.
		 * @return void
		 * @throws NamespaceException If an attempt is made to re-assign a built-in prefix to a new URI or, to register a namespace with a prefix that begins with the characters "xml" (in any combination of case) or an attempt is made to perform a prefix re-assignment that is forbidden for implementation-specific reasons.
		 * @throws UnsupportedRepositoryOperationException if this repository does not support namespace registry changes.
		 * @throws AccessDeniedException if the current session does not have sufficient access to register the namespace.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void register_namespace(string prefix, string uri);

		/**
		 * Removes a namespace mapping from the registry. The following restriction
		 * apply:
		 * * Attempting to unregister a built-in namespace (jcr, nt, mix, sv, xml or
		 * the empty namespace) will throw a NamespaceException.
		 * * An attempt to unregister a namespace that is not currently registered
		 * will throw a NamespaceException.
		 * * An implementation may prevent the unregistering of any other namespace
		 * for implementation-specific reasons by throwing a
		 * NamespaceException.
		 *
		 * @param prefix The prefix of the mapping to be removed.
		 * @return void
		 * @throws NamespaceException unregister a built-in namespace or a namespace that is not currently registered or a namespace whose unregistration is forbidden for implementation-specific reasons.
		 * @throws UnsupportedRepositoryOperationException if this repository does not support namespace registry changes.
		 * @throws AccessDeniedException if the current session does not have sufficient access to unregister the namespace.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract void unregister_namespace(string prefix);

		/**
		 * Returns an array holding all currently registered prefixes.
		 *
		 * @return string array
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string[] get_prefixes();

		/**
		 * Returns an array holding all currently registered URIs.
		 *
		 * @return string array
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string[] get_uris();

		/**
		 * Returns the URI to which the given prefix is mapped.
		 *
		 * @param prefix a string
		 * @return uri associated with prefix
		 * @throws NamespaceException if a mapping with the specified prefix does not exist.
		 * @throws RepositoryException if another error occurs
		 */
		public abstract string get_uri(string prefix);

		/**
		 * Returns the prefix which is mapped to the given uri.
		 * 
		 * @param uri a string
		 * @return prefix associated with uri
		 * @throws NamespaceException if a mapping with the specified uri does not exist.
		 * @throws RepositoryException if another error occurs
		 */
		public abstract string get_prefix(string uri);
		}
}
