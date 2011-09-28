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
	 * This interface encapsulates methods for the management of search queries.
	 *
	 * Provides methods for the creation and retrieval of search queries.
	 */
	public interface QueryManager : Object {

		/**
		 * Creates a new query by specifying the query statement itself and the language
		 * in which the query is stated.
		 *
		 * The language must be a string from among those returned by
		 * QueryManager.get_supported_query_languages.
		 *
		 * @param string statement The query statement to be executed.
		 * @param string language The language of the query to be created.
		 * @return a {@link Query} object
		 *
		 * @throws InvalidQueryException if the query statement is syntactically invalid or the specified language is not supported
		 * @throws RepositoryException if another error occurs
		 */
		public abstract Query create_query (string statement, string language);

		/**
		 * Returns a QueryObjectModelFactory with which a JCR-JQOM query can be built
		 * programmatically.
		 *
		 * @return QueryObjectModelFactory a QueryObjectModelFactory object
		 */
		public abstract QueryObjectModelFactory get_qom_factory ();

		/**
		 * Retrieves an existing persistent query.
		 *
		 * Persistent queries are created by first using QueryManagerInterface::createQuery to
		 * create a Query object and then calling Query.save() to persist the query to
		 * a location in the workspace.
		 *
		 * @param node a persisted query (that is, a node of type nt:query).
		 * @return Query a Query object.
		 *
		 * @throws InvalidQueryException If node is not a valid persisted query (that is, a node of type nt:query).
		 * @throws RepositoryException if another error occurs
		 */
		public abstract Query get_query (Node node);

		/**
		 * Returns an array of strings representing all query languages supported by
		 * this repository.
		 *
		 * This set must include at least the strings represented by the constants
		 * QueryInterface::JCR_SQL2 and QueryInterface::JCR_JQOM. An implementation
		 * may also support other languages.
		 *
		 * @return an array of supported languages by the query.
		 *
		 * @throws RepositoryException if an error occurs.
		 */
		public abstract string[] get_supported_query_languages ();
	}
}
