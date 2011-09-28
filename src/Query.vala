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
	 * A Query object.
	 */
	public interface Query : Object {

		/**
		 * A string constant representing the JCR-JQOM query language.
		 */
		public const string JCR_JQOM = "JCR-JQOM";

		/**
		 * A string constant representing the JCR-SQL2 query language.
		 */
		public const string JCR_SQL2 = "JCR-SQL2";

		/**
		 * Binds the given value to the variable named $varName.
		 *
		 * @param varName name of variable in query
		 * @param val value to bind
		 * @return void
		 *
		 * @throws InvalidArgumentException if $varName is not a valid variable in this query.
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract void bind_value (string varName, Value val);

		/**
		 * Executes this query and returns a QueryResult object.
		 *
		 * @return a {@link QueryResult} object
		 *
		 * @throws InvalidQueryException if the query contains an unbound variable.
		 * @throws RepositoryException if an error occurs
		 */
		public abstract QueryResult execute ();

		/**
		 * Returns the names of the bind variables in this query.
		 *
		 * If this query does not contains any bind variables then an empty array is returned.
		 *
		 * @return array of the names of the bind variables in this query.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string[] get_bind_variable_names ();

		/**
		 * Sets the maximum size of the result set to limit.
		 *
		 * @param limit The amount of result items to be fetched.
		 * @return void
		 */
		public abstract int set_limit (int limit);

		/**
		 * Sets the start offset of the result set to offset.
		 *
		 * @param offset The start point of the result set from when the item shall be fetched.
		 * @return void
		 */
		public abstract void set_offset (int offset);

		/**
		 * Returns the statement defined for this query.
		 *
		 * If the language of this query is string-based (like JCR-SQL2), this method
		 * will return the statement that was used to create this query.
		 *
		 * If the language of this query is JCR-JQOM, this method will return the
		 * JCR-SQL2 equivalent of the JCR-JQOM object tree.
		 *
		 * This is the standard serialization of JCR-JQOM and is also the string stored
		 * in the jcr:statement property if the query is persisted. See storeAsNode($absPath).
		 *
		 * @return The query statement.
		 */
		public abstract string get_statement ();

		/**
		 * Returns the language set for this query.
		 *
		 * This will be one of the query language constants returned by
		 * QueryManager.get_supported_query_languages.
		 *
		 * @return The query language.
		 */
		public abstract string get_language ();

		/**
		 * Fetches the path of the node representing this query.
		 *
		 * If this is a Query object that has been stored using store_as_node()
		 * (regardless of whether it has been saved yet) or retrieved using
		 * QueryManager.get_query), then this method returns the path
		 * of the nt:query node that stores the query.
		 *
		 * @return Path of the node representing this query.
		 *
		 * @throws ItemNotFoundException if this query is not a stored query.
		 * @throws RepositoryException if another error occurs.
		 */
		public abstract string get_stored_query_path ();

		/**
		 * Creates a node of type nt:query holding this query at absPath and
		 * returns that node.
		 *
		 * This is  a session-write method and therefore requires a
		 * Session.save to dispatch the change.
		 *
		 * The absPath provided must not have an index on its final element. If
		 * ordering is supported by the node type of the parent node then the new
		 * node is appended to the end of the child node list.
		 *
		 * @param string absPath absolute path the query should be stored at
		 * @return Node the newly created node.
		 *
		 * @throws ItemExistsException if an item at the specified path already exists,
		 *                                    same-name siblings are not allowed and this implementation performs
		 *                                    this validation immediately.
		 * @throws PathNotFoundException if the specified path implies intermediary Nodes that do not exist
		 *                                      or the last element of relPath has an index, and this implementation
		 *                                      performs this validation immediately.
		 * @throws ConstraintViolationException if a node type or implementation-specific constraint
		 *                                                      is violated or if an attempt is made to add a node as
		 *                                                      the child of a property and this implementation
		 *                                                      performs this validation immediately.
		 * @throws VersionException if the node to which the new child is being added is read-only due to
		 *                                         a checked-in node and this implementation performs this validation
		 *                                         immediately.
		 * @throws LockException if a lock prevents the addition of the node and this implementation performs
		 *                                   this validation immediately instead of waiting until save.
		 * @throws UnsupportedRepositoryOperationException in a level 1 implementation.
		 * @throws RepositoryException if another error occurs or if the absPath provided has an index on its final
		 *                                    element.
		 */
		public abstract Node store_as_node (string absPath);
	}
}
